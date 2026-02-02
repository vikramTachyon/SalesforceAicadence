import { LightningElement, wire } from 'lwc';
import getEmailsSent from '@salesforce/apex/CadenceDashboardController.getEmailsSent';
import { refreshApex } from '@salesforce/apex';

export default class CadenceDashboard extends LightningElement {

    emailsSent = 0;
    wiredResult;

    @wire(getEmailsSent)
    wiredEmails(result) {
        this.wiredResult = result;
        if (result.data) {
            this.emailsSent = result.data;
        }
    }

    connectedCallback() {
        // Force refresh when component loads
        setTimeout(() => {
            refreshApex(this.wiredResult);
        }, 500);
    }
}