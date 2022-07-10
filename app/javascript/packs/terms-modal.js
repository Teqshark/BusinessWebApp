var termsModal = document.getElementById("termsModal");

window.toggleModal = function toggleModal() {
  termsModal.toggle;
  if (termsModal.classList) {
    termsModal.classList.toggle("modal-hidden");
    termsModal.classList.toggle("modal-visiblel");
  } else {
    console.log("!termsModal.classList");
  }
};
