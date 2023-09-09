import { LightningElement } from 'lwc';

export default class CreateAccount extends LightningElement {

    successMessage;
    successHandler(event){
        this.successMessage='A new account has been created: '+ event.detail.id;
    }
    
}