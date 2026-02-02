import { LightningElement } from 'lwc';

export default class Homwwork extends LightningElement {
    name = '';
    userinput(event){
        this.name =event.target.value;
    }
    submit(){
        console.log('you entered',this.name);
        alert('hey'+ this.name)
    }
}