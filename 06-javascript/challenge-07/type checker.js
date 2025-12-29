const typeOf = (value) => {
  if (value === null) return "null";
  if (value === undefined) return "undefined";
  if (Number.isNaN(value)) return "nan";

  const type = typeof value;
  if (type !== "object") return type;    

  const tag = Object.prototype.toString.call(value).slice(8, -1).toLowerCase();

  return tag;  
};

console.log(typeOf(null));           
console.log(typeOf(undefined));      
console.log(typeOf(42));             
console.log(typeOf(NaN));            
console.log(typeOf('hello'));        
console.log(typeOf(true));           
console.log(typeOf(Symbol()));       
console.log(typeOf([]));             
console.log(typeOf({}));             
console.log(typeOf(() => {}));       
console.log(typeOf(new Date()));     
console.log(typeOf(new Map()));      
console.log(typeOf(new Set()));      
console.log(typeOf(/regex/));        
console.log(typeOf(new Error()));    
console.log(typeOf(Promise.resolve())); 