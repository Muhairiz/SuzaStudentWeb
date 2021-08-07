<div class="sidenav">
  <div><a href="index.jsp">Home</a></div>
  <button class="dropdown-btn">Result
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="result.jsp">Record Result</a>
    <a href="#">Manage Result</a>
    <a href="viewresults.jsp">All Result</a>
  </div> 
</div>

<script type="text/javascript">
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>