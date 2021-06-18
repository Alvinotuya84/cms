<table class="table_mainWrapper">
<tr>
<td id="td_aside">

<aside>
	<a href="../manufacturer/edit_profile.php">Edit Profile</a>
	<button class="accordion">addition </button>

<div class="panel">

    <a href="../manufacturer/add_product.php">Add Products</a>

</div>

<button class="accordion">management </button>
<div class="panel">
    <a href="../manufacturer/manage_stock.php">Manage Stock</a>
	<a href="../manufacturer/view_unit.php">Manage Unit</a>
	<a href="../manufacturer/view_category.php">Manage Category</a>
</div>
<a href="../logout.php"><input type="button" value="Log out" class="submit_button_logout"></a>
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>
</aside>

</td>
<td id="td_section">

