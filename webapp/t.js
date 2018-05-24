let result = "test".split("").map((v, i) => v + (i + 1)).join("").slice(0, -1);

let x = 0;
async function test() {
	x += await 2;
	console.log(x, "await");
};
test();
x+=1;
console.log(x,"norma;");
