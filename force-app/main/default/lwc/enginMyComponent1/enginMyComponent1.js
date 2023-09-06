import { LightningElement } from 'lwc';

export default class EnginMyComponent1 extends LightningElement {

firstName;
lastName;
firstNameHandler(event){
    this.firstName=event.target.value;
}
lastNameHandler(event){
    this.lastName=event.target.value;
}


get fullName(){

    return `${this.firstName} ${this.lastName}`;
}

}