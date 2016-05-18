///<reference path='models/house.ts'/>
///<reference path='models/lord.ts'/>
///<reference path='models/smallfolk.ts'/>
///<reference path='models/territory.ts'/>
///<reference path='models/weapon.ts'/>
///<reference path='models/sword.ts'/>

let stark = new House('Stark', 'a direwolf', "'Winter is Coming'");

let theNorth = new Territory('The North', 'Winterfell');

let ice = new Sword('Ice', 'Valyrian Steel')


console.log(stark.describe());

let ned = new Lord('Eddard', 'Male', stark, theNorth);
ned.addWeapon(ice)

let hotPie = new Smallfolk('Hot Pie', 'Male', 'Baker');



console.log(ned);
console.log(hotPie);