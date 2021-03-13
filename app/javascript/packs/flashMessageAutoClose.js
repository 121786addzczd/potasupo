// HTMLが最初に読み込まれたときに動作する関数を定義
document.addEventListener('DOMContentLoaded',() => {

  const flashMessage = document.getElementById('js-flashMessage');

  // フェードアウトさせる（徐々に透過し,非表示にする）関数を定義
  const fadeOutFlashMessage = () => {
    // setIntervalを特定するために返り値を変数timer_idに格納
    const timer_id = setInterval(() => {
      const opacity = flashMessage.style.opacity;

      if (opacity > 0) {
        flashMessage.style.opacity = opacity - 0.02;
      } else {
        flashMessage.style.display = 'none';
        clearInterval(timer_id);
      };
    }, 30); // 0.03秒ごとにsetIntervalを実行
  }

  if (flashMessage !== null) {

    flashMessage.style.opacity = 1;
    // 今回は表示から3秒後に上記で定義したフェードアウトさせる関数を実行
    setTimeout(fadeOutFlashMessage, 3000);
  };
});