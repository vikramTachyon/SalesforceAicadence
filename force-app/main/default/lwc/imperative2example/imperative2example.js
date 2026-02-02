import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/ImperativeCAlls.getAccount';

export default class ImperativeCallExample extends LightningElement {
    keyword = '';
    accounts = [];
    showTable = false;
    showNoRecords = false;

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' }
    ];

    handleChange(event) {
        this.keyword = event.target.value;
    }

    handleSearch() {
        getAccounts({ keyword: this.keyword })
            .then(result => {
                this.accounts = result;

                if (result.length > 0) {
                    this.showTable = true;
                    this.showNoRecords = false;
                } else {
                    this.showTable = false;
                    this.showNoRecords = true;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                this.showTable = false;
                this.showNoRecords = true;
            });
    }
}