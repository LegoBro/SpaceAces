//Everything here is an upgraded version of what is found in fs
const fs = require("fs");
console.log(`\x1b[32mLoaded library afs successfully.\x1b[0m`);
module.exports = {
	//Similar to mkdirSync, but creates all folders at once
	mkdirsSync: function(path) {
		let createdPath = ".";
		let ppath = path.split("/");
		for(let i=1;i<ppath.length;i++) {
			createdPath = createdPath + "/" +ppath[i];
			let exists = fs.existsSync(createdPath);
			if(exists==false) {
				try {
					fs.mkdirSync(createdPath);
				} catch(e) {
					console.log("Error creating path: " + createdPath);
				}
			}
		}
	},
	rmdirsSync: function(path) {
		let test = fs.statSync(path);
		if(test.isFile()==true) {
			fs.unlinkSync(path);
		} else {
			try {
				fs.rmdirSync(path);
			} catch(e) {
				let subfiles = fs.readdirSync(path);
				for(let i=0;i<subfiles.length;i++) {
					module.exports.rmdirsSync(path + "\\" + subfiles[i]);
				}
				fs.rmdirSync(path);
			}
		}
	},
	copyFilesSync: function(item,dest) {
		//console.log("copying "+item+" to "+dest)
		let test = fs.statSync(item);
		let finalItem = item.split("/").pop();
		if(test.isFile()==true) {
			fs.copyFileSync(item,dest+"/"+finalItem);
		}	else if(test.isDirectory()==true) {
			try {
				try{
					fs.mkdirSync(dest + "/" + finalItem);
				} catch(err) {};
				let subfiles = fs.readdirSync(item);
				for(let i=0;i<subfiles.length;i++) {
					module.exports.copyFilesSync(item + "/" + subfiles[i],dest + "/" + finalItem);
				}
			} catch(e) {
				console.log("Error!  It appears that one of the directories doesn't exist!");
			}
		}
	}
}
