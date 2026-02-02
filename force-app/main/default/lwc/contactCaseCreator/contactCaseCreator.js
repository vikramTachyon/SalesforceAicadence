import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = ['Contact.Auto_Created_Case__c'];

export default class CreateContact extends LightningElement {
    contactId;
    caseId;

    handleSuccess(event) {
        this.contactId = event.detail.id;
    }

    @wire(getRecord, { recordId: '$contactId', fields: FIELDS })
    wiredContact({ data }) {
        if (data) {
            this.caseId = data.fields.Auto_Created_Case__c.value;
        }
    }

    handleShowCase() {
        // nothing fancy
    }
}