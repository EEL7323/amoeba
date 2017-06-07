
function eraseCookie(name) {
    document.cookie = name + '=; Max-Age=0'
}

function logout() {
	eraseCookie("token");
    localStorage.setItem("token", "");
    window.location.replace("/");
}

function goToEmployeePage() {
    window.location.href = "/funcionario";
}

function updateUserCounter() {
    $.ajax({
    url: "/api/numeroUsuariosNoRestaurante",
    type: 'GET',
    async: false,
    success: function(data) {
    	$("#userCounter").html(data["numUsuarios"]);
    }
    });
}


$(document).ready(function() {
    window.setInterval(function(){updateUserCounter();},2000);
});
