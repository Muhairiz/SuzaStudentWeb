<div class="sidenav">
  <div class="active"><a href="index.jsp">Home</a></div>
  <button class="dropdown-btn">Attendance 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Record Attendance</a>
    <a href="#">Manage Attendance</a>
  </div> 
  
  <button class="dropdown-btn">Course Work 
    <span class="fa fa-caret-down"></span>
  </button>
  <div class="dropdown-container">
    <a href="#">Add Course Work</a>
    <a href="#">Manage Course Work</a>
  </div>
  
 <button class="dropdown-btn">Exam Results 
    <span class="fa fa-caret-down"></span>
  </button>
  <div class="dropdown-container">
    <a href="#">View Exam Results</a>
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