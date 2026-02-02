import { LightningElement } from 'lwc';
export default class Firstlwcassign extends LightningElement {
defaultMessage ='HEllo Thank you';
message=this.defaultMessage;
handleChange(event){
    this.message=event.target.value;
}
handleClick(){
    this.message =this.defaultMessage;
}
}