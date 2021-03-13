if (document.URL.match( /sign_up/ ) || document.URL.match( /sign_in/ )) {
  document.addEventListener("DOMContentLoaded",  () => {

    const pwd = document.getElementById('js_password')
    const pwdCheck = document.getElementById('js_passwordCheck')
    const pwdDisplayText =document.getElementById('js_passwordDisplayText')

    pwdCheck.addEventListener('change', () => {
        if(pwdCheck.checked) {
          pwdDisplayText.innerHTML = 'パスワードを非表示にする'
            pwd.setAttribute('type', 'text')
        } else {
          pwdDisplayText.innerHTML = 'パスワードを表示する'
            pwd.setAttribute('type', 'password')
        }
    }, false)

  })
}