import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Account.Name',
    'Account.Industry',
    'Account.AnnualRevenue'
];

export default class AccountViewEdit extends LightningElement {
    @api recordId;
    isEditMode = false;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    account;

    get name() {
        return this.account?.data?.fields?.Name?.value;
    }

    get industry() {
        return this.account?.data?.fields?.Industry?.value;
    }

    get revenue() {
        return this.account?.data?.fields?.AnnualRevenue?.value;
    }

    handleEdit() {
        this.isEditMode = true;
    }

    handleCancel() {
        this.isEditMode = false;
    }

    handleSuccess() {
        this.isEditMode = false; // back to view mode after save
    }
}