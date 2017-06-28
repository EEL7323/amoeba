
$(document).ready(function() {
    // DOM ready
    $(".forget-data").hide();
    $("#erro-login").hide();
    //Load profile if it exits
    loadProfile();

    document.getElementById('login-btn').onclick = function(){
        login();
    }
});

/**
 * Function that gets the data of the profile in case
 * thar it has already saved in localstorage. Only the
 * UI will be update in case that all data is available
 *
 * A not existing key in localstorage return null
 *
 */
function getLocalProfile(callback){
    var profileImgSrc      = localStorage.getItem("PROFILE_IMG_SRC");
    var profileName        = localStorage.getItem("PROFILE_NAME");
    var profileReAuthMatricula = localStorage.getItem("PROFILE_MATRICULA");

    if(profileName !== null
            && profileReAuthMatricula !== null
            && profileImgSrc !== null) {
        callback(profileImgSrc, profileName, profileReAuthMatricula);
    }
}

function login(){
    if($('#remember').is(":checked"))
    {
        var saveLocalData = true;
    }
    var matricula = $("#matricula-salva").html();
    if (!((matricula)&&(matricula.trim()!='')))
        var matricula = $("#matricula").val();

    var senha = $("#password").val();

    if ( !((senha)&&(senha.trim()!='')) || !((matricula)&&(matricula.trim()!='')) )
    {
        loginError();
        return;
    }

    var formData = {
        "matricula": matricula,
        "senha": senha
    };

    //Fazer login aqui
    var login = false;
    var loginData = {};

    $.ajax({
        url: "/api/token",
        type: 'POST',
        async: false,
        data: formData,
        error : function(err) {
            console.log('Erro de login!', err)
        },
        success: function(data) {
            if (data["status"]=="OK"){
                login = true
                loginData = data
            }
        }
    });

    //Mostrar mensagem de erro se o login falhar
    if (loginData["status"] != "OK")
    {
        loginError();
        return;
    }

    //Senão
    //Salvar token local
    localStorage.setItem("token", "Bearer " + loginData["token"]);
    tipo_usuario = loginData["tipo_usuario"];


    //Salvar dados locais, se o checkbox estiver selecionado
    if (saveLocalData){
        $.ajax({
            url: "/api/saveLocalData",
            type: 'POST',
            async: false,
            data: formData,
            success: function(data) {
                localStorage.setItem("PROFILE_IMG_SRC", data["imagem"]);
                localStorage.setItem("PROFILE_NAME", data["nome"]);
                localStorage.setItem("PROFILE_MATRICULA", data["matricula"]);
            }
        });
    }

    //Redirecionar para área de usuário
    if (tipo_usuario=="funcionario")
    {
       window.location.href = "/funcionario";
    }
    else
    {
       window.location.href = "/usuario";
    }
}

function loadProfile() {
    if(!supportsHTML5Storage()) { return false; }

    getLocalProfile(function(profileImgSrc, profileName, profileReAuthMatricula) {
        $("#profile-img").attr("src",profileImgSrc);
        $("#nome").html(profileName);
        $("#matricula-salva").html(profileReAuthMatricula);
        $("#matricula").hide();
        $("#remember_div").hide();
        $(".forget-data").show();
    });
}

function forgetProfile() {
    localStorage.clear();
    location.reload();
}

function supportsHTML5Storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}

function loginError()
{
    $( "#login-container" ).effect( "shake" );
    $("#erro-login").show();
}
