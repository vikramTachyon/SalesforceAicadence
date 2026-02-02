import { LightningElement, wire, track } from 'lwc';
import getLeads from '@salesforce/apex/LeadViewController.getLeads';

export default class LeadsView extends LightningElement {
    @track searchKey = '';
    @track leads = [];

    @wire(getLeads, { searchKey: '$searchKey' })
    wiredLeads({ data, error }) {
        if (data) {
            this.leads = data;
        }
        if (error) {
            console.error(error);
        }
    }

    handleSearch(event) {
        this.searchKey = event.target.value;
    }
}