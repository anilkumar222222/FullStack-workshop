const book={
	title: "Hobbit",
	author: "J.R.R. Tolkien",
	pages: 310,
	isRead: true,
	getSummary(){
		return book.title+" by "+book.author+", "+book.pages+" pages"
	}
}
console.log(book.title)
console.log(book.getSummary())


const user = {
    name: 'Alice',
    address: {
        city: 'Seattle',
        zip: '98101'
    }
};

function getProperty(obj, path) {
    let p=path.split(".")
   
	for(let i=0;i<p.length;i++){
		if(obj==null)
		{
			return undefined;
		}
		obj=obj[p[i]];
	}
	return obj
}

console.log(getProperty(user, 'name'));           
console.log(getProperty(user, 'address.city'));   
console.log(getProperty(user, 'address.country'));
console.log(getProperty(user, 'phone.number'));

const counter = {
	countProperty: 0,
	increment(){
		this.countProperty+=1
	},
	decrement(){
		this.countProperty-=1
	},
	reset(){
		this.countProperty=0
	},
	getCount(){
		return this.countProperty
	}
}

counter.increment();
counter.increment();
console.log(counter.getCount()); 
counter.decrement();
console.log(counter.getCount());
counter.reset();
console.log(counter.getCount());


function calculator(){
	let res = 0;
	return {
		add(value){
			res += value;
			return this;
		},
		subtract(value){
			res -= value;
			return this;
		},
		multiply(value){
			res *= value;
			return this;
		},
		divide(value){
			res /= value;
			return this;
		},
		getResult(){
			return res;
		},
		reset(){
			res = 0;
			return this;
		}
	};
}

const calc = calculator();

const result = calc.add(10).subtract(2).multiply(3).divide(4).getResult();

console.log(result);


const product = {
    id: 101,
    name: 'Laptop',
    price: 999,
    specs: {
        ram: '16GB',
        storage: '512GB SSD'
    }
};

const name = product.name
const price = product.price
const ram = product?.specs?.ram

console.log(name);  
console.log(price); 
console.log(ram);   

const config = {
    theme: 'dark',
    fontSize: 14
};

const {
    theme: colorTheme,
    fontSize,
    language = 'en',
    debugMode = false
} = config;

console.log(colorTheme); 
console.log(fontSize);   
console.log(language);   
console.log(debugMode);  

const users = [
    { id: 1, name: 'Alice', email: 'alice@example.com', role: 'admin' },
    { id: 2, name: 'Bob', email: 'bob@example.com' },
    { id: 3, name: 'Charlie', email: 'charlie@example.com', role: 'editor' }
];


function formatUser(usr) {
	return usr.name+"("+usr.role+"): "+usr.email
}

users.forEach(user => console.log(formatUser(user)));

const defaults = { theme: 'light', notifications: true, language: 'en' };
const userPrefs = { theme: 'dark', fontSize: 16 };


const finalSettings = {
	...defaults,
	...userPrefs,
	timestamp: new Date()
};

console.log(finalSettings);

const students = [
    { id: 1, name: 'Alice', scores: [85, 90, 78] },
    { id: 2, name: 'Bob', scores: [70, 75, 80] },
    { id: 3, name: 'Charlie', scores: [90, 95, 88] }
];

function getAverage(scores) {
    let total = 0;
    for (let score of scores) {
        total = total + score;
    }

    let average = total / scores.length;

    return Number(average.toFixed(2));
}

function transformStudents(students) {
    let result = {};

    for (let student of students) {
        let avgScore = getAverage(student.scores); 
        result[student.name] = avgScore;            
    }

    return result;
}

console.log(transformStudents(students));	