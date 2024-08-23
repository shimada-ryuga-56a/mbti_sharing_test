function modalOperation() {
  const modalOpen = document.getElementById("modalOpen");
  const modalClose = document.querySelector(".modalClose");
  const modal = document.getElementById("modalSelf");

  modalOpen.addEventListener("click", () => {
    modal.style.display = "block";
    document.body.style.overflow = "hidden";
  });

  modalClose.addEventListener("click", () => {
    modal.style.display = "none";
    document.body.style.overflow = "";
  });

  document.addEventListener("click", (evt) => {
    // console.log(evt.target);
    if (evt.target == modalSelf) {
      modal.style.display = "none";
      document.body.style.overflow = "";
    }
  });
}

window.addEventListener("turbo:load", modalOperation);
