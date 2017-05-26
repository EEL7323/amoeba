
function eraseCookie(name) {
    document.cookie = name + '=; Max-Age=0'
}

function logout() {
	eraseCookie("token");
    localStorage.setItem("token", "");
    window.location.href = "/";
}
