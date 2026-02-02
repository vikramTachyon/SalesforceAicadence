import { LightningElement, api } from 'lwc';

export default class CadenceKpiCard extends LightningElement {
    @api title;
    @api value;
    @api trend;
    @api trendType; // up or down

    get trendClass() {
        return this.trendType === 'up'
            ? 'slds-text-color_success'
            : 'slds-text-color_error';
    }
}