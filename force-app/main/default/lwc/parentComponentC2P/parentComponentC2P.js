import { LightningElement } from 'lwc';

export default class ParentComponentC2P extends LightningElement {

    countvalue = 0;

    handleAdd() {
          this.countvalue++
    }

    handleSubtract() {
        this.countvalue--
    }
}