Cat = (function () {
	const NONE_PACK = "pax/waiter.zip";
	const DEFAULT_CONFIG = {
		"args":[],"canvasResizePolicy":0,"executable":"engine/gd353","experimentalVK":false,
		"fileSizes":{"engine/gd353.wasm":17865444},"focusCanvas":false,"gdnativeLibs":[],
		"unloadAfterInit":false, // don't unload
		"mainPack":NONE_PACK,
	};
	
	let engine = new Engine(DEFAULT_CONFIG);
	let engineGameLoaded = null;
	let gameProperties = {};
	if (!Engine.isWebGLAvailable()) { engine = null; console.log("TODO: display 'WebGL not available' message."); }

	var _prog = function(current, total) {
		if (total > 0) {
			console.log(`progress... ${current}/${total}`);
		} else {
			console.log("indeterminate progress...");
		}
	}

	var load = function(pack) {
		if (engine==null) {console.log("Cat.load failed - no engine"); return;}
		var promise = engine.startGame({"args":[],"mainPack":pack,"onProgress":_prog});
		promise.then(
			()=>{console.log("Cat.load succeeded"); engineGameLoaded=(pack==NONE_PACK); gameProperties={};},
			(err)=>{console.log("Cat.load failed - err "+(err.message||err));}
		);
	}

	var unload = function() {
		if (engine==null) {console.log("Cat.unload failed - no engine"); return;}
		if (engineGameLoaded) { load(NONE_PATH); }
	}

	var set_gprop = function(k,v) {
		gameProperties[k]=v;
		console.log("updated game properties:");
		console.log(gameProperties);
		if (k == 'bg_color') {
			document.getElementById("canvas-container").style.background = v;
		}
	}

	var get_gprop = function(key, defaultValue) {
		return gameProperties[key] || defaultValue;
	}

	load(NONE_PACK); // automatically load NONE_PACK.

	return {
		load: load,
		unload: unload,
		set_gprop: set_gprop,
		get_gprop: get_gprop,
	}
}());
console.log("trying to register Cat to window...")
if (typeof window !== 'undefined') {
	window['Cat'] = Cat;
	console.log("it must be done. is Cat in window?")
	console.log(window['Cat'])
}

// (function() {
// 	// const INDETERMINATE_STATUS_STEP_MS = 100;
// 	// var statusProgress = document.getElementById('status-progress');
// 	// var statusProgressInner = document.getElementById('status-progress-inner');
// 	// var statusIndeterminate = document.getElementById('status-indeterminate');
// 	// var statusNotice = document.getElementById('status-notice');

// 	// var initializing = true;
// 	// var statusMode = 'hidden';

// 	// var animationCallbacks = [];
// 	// function animate(time) {
// 	// 	animationCallbacks.forEach(callback => callback(time));
// 	// 	requestAnimationFrame(animate);
// 	// }
// 	// requestAnimationFrame(animate);

// 	// function setStatusMode(mode) {

// 	// 	if (statusMode === mode || !initializing)
// 	// 		return;
// 	// 	[statusProgress, statusIndeterminate, statusNotice].forEach(elem => {
// 	// 		elem.style.display = 'none';
// 	// 	});
// 	// 	animationCallbacks = animationCallbacks.filter(function(value) {
// 	// 		return (value != animateStatusIndeterminate);
// 	// 	});
// 	// 	switch (mode) {
// 	// 		case 'progress':
// 	// 			statusProgress.style.display = 'block';
// 	// 			break;
// 	// 		case 'indeterminate':
// 	// 			statusIndeterminate.style.display = 'block';
// 	// 			animationCallbacks.push(animateStatusIndeterminate);
// 	// 			break;
// 	// 		case 'notice':
// 	// 			statusNotice.style.display = 'block';
// 	// 			break;
// 	// 		case 'hidden':
// 	// 			break;
// 	// 		default:
// 	// 			throw new Error('Invalid status mode');
// 	// 	}
// 	// 	statusMode = mode;
// 	// }

// 	// function animateStatusIndeterminate(ms) {
// 	// 	var i = Math.floor(ms / INDETERMINATE_STATUS_STEP_MS % 8);
// 	// 	if (statusIndeterminate.children[i].style.borderTopColor == '') {
// 	// 		Array.prototype.slice.call(statusIndeterminate.children).forEach(child => {
// 	// 			child.style.borderTopColor = '';
// 	// 		});
// 	// 		statusIndeterminate.children[i].style.borderTopColor = '#dfdfdf';
// 	// 	}
// 	// }

// 	// function setStatusNotice(text) {
// 	// 	while (statusNotice.lastChild) {
// 	// 		statusNotice.removeChild(statusNotice.lastChild);
// 	// 	}
// 	// 	var lines = text.split('\n');
// 	// 	lines.forEach((line) => {
// 	// 		statusNotice.appendChild(document.createTextNode(line));
// 	// 		statusNotice.appendChild(document.createElement('br'));
// 	// 	});
// 	// };

// 	// function displayFailureNotice(err) {
// 	// 	var msg = err.message || err;
// 	// 	console.error(msg);
// 	// 	setStatusNotice(msg);
// 	// 	setStatusMode('notice');
// 	// 	initializing = false;
// 	// };

// 	// if (!Engine.isWebGLAvailable()) {
// 	// 	displayFailureNotice('WebGL not available');
// 	// } else {
// 	// 	setStatusMode('indeterminate');
// 	// 	engine.startGame({
// 	// 		'onProgress': function (current, total) {
// 	// 			if (total > 0) {
// 	// 				statusProgressInner.style.width = current/total * 100 + '%';
// 	// 				setStatusMode('progress');
// 	// 				if (current === total) {
// 	// 					// wait for progress bar animation
// 	// 					setTimeout(() => {
// 	// 						setStatusMode('indeterminate');
// 	// 					}, 500);
// 	// 				}
// 	// 			} else {
// 	// 				setStatusMode('indeterminate');
// 	// 			}
// 	// 		},
// 	// 	}).then(() => {
// 	// 		setStatusMode('hidden');
// 	// 		initializing = false;
// 	// 	}, displayFailureNotice);
// 	// }
// })();