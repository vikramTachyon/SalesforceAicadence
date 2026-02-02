import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/ImperativeCAlls.getAccount';
export default class ImperativeCallExample extends LightningElement {

    keyword = '';
    accounts = [];

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
    ];

    handleChange(event) {
        this.keyword = event.target.value;
    }

    handleSearch() {
        getAccounts({ keyword: this.keyword })
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
}