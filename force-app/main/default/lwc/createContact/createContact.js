import { LightningElement } from 'lwc';

export default class CreateContact extends LightningElement {

    successMessage;
    successHandler(event){
        this.successMessage='A new contact has been created: '+ event.detail.id;
    }
    
}