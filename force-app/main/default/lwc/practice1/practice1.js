import { LightningElement } from 'lwc';
export default class Practice1 extends LightningElement {
    message = "hello trailblazer"
    handleClick() {
        this.message = "Hello trailblazzer"
    }

}