import { LightningElement, wire, track } from 'lwc';
import getLeads from '@salesforce/apex/LeadService.getLeads';
import { refreshApex } from '@salesforce/apex';

export default class CadenceLeads extends LightningElement {

    @track leads;
    @track error;
    wiredResult;

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Company', fieldName: 'Company' },
        { label: 'Status', fieldName: 'Status' },
        { label: 'Email', fieldName: 'Email' }
    ];

    @wire(getLeads)
    wiredLeads(result) {
        this.wiredResult = result;
        if (result.data) {
            this.leads = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.leads = undefined;
        }
    }

    refreshData() {
        refreshApex(this.wiredResult);
    }
}