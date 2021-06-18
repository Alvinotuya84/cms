<table class="table_mainWrapper">
<tr>
<td id="td_aside">

<aside>

	<button class="accordion">Addition</button>
<div class="panel">

   <a href="../admin/add_product.php">Add Products</a>
	<a href="../admin/add_retailer.php">Add Retailers</a>
	<a href="../admin/add_manufacturer.php">Add Manufacturer</a>
	<a href="../admin/add_distributor.php">Add Distributor</a>

</div>

<button class="accordion">management </button>
<div class="panel">
<a href="../admin/view_unit.php">Manage Unit</a>
	<a href="../admin/view_category.php">Manage Category</a>
	<a href="../admin/view_area.php">Manage Area</a>
</div>

<a href="../admin/change_password.php">Change Password</a>
<a href="../logout.php"><input type="button" value="Log out" class="submit_button_logout"></a>

</aside>

</td>
<td id="td_section">

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