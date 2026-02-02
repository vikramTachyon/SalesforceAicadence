import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class MyzimeAi extends NavigationMixin(LightningElement) {

    connectedCallback() {
        this.dispatchEvent(new CloseActionScreenEvent());

        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'zime_ai'
            }
        });
    }
}