const cpath = '${cpath}';
const searchBtn = document.getElementById('searchBtn');
const dataList = document.querySelector('.dataList');
const map = document.querySelector('.map');
const list = map.querySelectorAll('button');

// 검색
const makeToList = function(json) {
	const div = document.createElement('div');
	div.classList.add('dataList');

	for(let i = 0; i < json.length; i++) {
		console.log("fdfe : " + json[i].fname);
		const div1 = document.createElement('div');
		const a = document.createElement('a');
		const img = document.createElement('img');
		const div2 = document.createElement('div');
		const div3 = document.createElement('div');
		const div4 = document.createElement('div');

		a.appendChild(img);
		div2.appendChild(a);
		div1.appendChild(div2);
		div1.appendChild(div3);
		div1.appendChild(div4);

		div1.classList.add('dataDiv');
		div3.classList.add('dataName');
		div4.classList.add('dataAddr');

		div3.innerText = json[i].cname;
		div4.innerText = json[i].caddr.split(' ')[0];
		div4.innerText += ' ' + json[i].caddr.split(' ')[1];
		img.src = cpath + '/uploadFile/cafe/' + json[i].cpic;
		a.href = cpath + '/cafeInfo/' + json[i].cname + '/';
		div.appendChild(div1);
	}
	return div;
}

// 검색 버튼누르면

searchBtn.onclick = function() {
	dataList.innerHTML = '';	// list 다 지우고
	let search = document.getElementById('search').value; // 검색한 text 불러오고

	console.log("search : " + search);

	const url = cpath + '/cafe/' + search;
	const opt = {
		method: 'GET',
	}
	fetch(url,opt)
		.then(resp => resp.json())
		.then(json => {
			console.log("json : " + json);
			dataList.appendChild(makeToList(json)); // json형태로 searchList에 어펜드차일드
		});
}

// map 눌렀을때
list.forEach(ele => {
	ele.onclick = (event) => {
		dataList.innerHTML = '';

		var addr = ele.innerText;
		console.log('addr : ' + addr)
		const url = cpath + '/cafeAddr/' + addr +'/';
		console.log('url : ' + url);
		const opt = {
			method : 'GET',
		}
		fetch(url,opt)
			.then(resp => resp.json())
			.then(json => {
				console.log(json);
				dataList.appendChild(makeToList(json));
			})
	}
})