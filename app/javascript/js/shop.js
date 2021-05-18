const editor = document.querySelector(".schedule-editor")
const update = checkbox => {
  const inputs = checkbox.parentNode.parentNode.parentNode.querySelectorAll("input[type='time']")
  const closedShops = checkbox.parentNode.parentNode.parentNode.querySelectorAll(".closed-shop")

  if(checkbox.checked){
    inputs.forEach(input => input.classList.remove("item-hidden"))
    closedShops.forEach(closedShop => closedShop.classList.add("item-hidden"))

  } else {
    inputs.forEach(input => input.classList.add("item-hidden"))
    closedShops.forEach(closedShop => closedShop.classList.remove("item-hidden"))
  }
}
if(editor){
  let checkboxes = editor.querySelectorAll("input[type='checkbox']")

  checkboxes.forEach(checkbox => {
    update(checkbox)
    checkbox.addEventListener("click", () => {
      update(checkbox)
    })
  })
}
