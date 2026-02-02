import { LightningElement, api } from 'lwc';

export default class KpiCard extends LightningElement {
    @api title;
    @api value;
}