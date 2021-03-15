if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImageList = document.getElementById('spot-image-list')

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.id = "preview";
      blobImage.classList.add('spot-preview');

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `spot_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'spot[images][]')
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('spot-image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
      createImageHTML(blob)

    });
  });
}


