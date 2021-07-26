window.addEventListener("trix-file-accept", function(event) {
    const acceptedTypes = ['image/jpeg', 'image/jpg', 'image/png']
    if (!acceptedTypes.includes(event.file.type)) {
        event.preventDefault()
        alert("Only support attachment of jpeg, jpg or png files")
    }
})