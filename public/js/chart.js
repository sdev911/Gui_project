
$(document).ready(function(){

	// calling this method draws the chord layout chart using these two JSON files
	drawChart(baseURL+'/users/colorData/', baseURL+'/users/followData/');

	$('#changeColorForm').submit(function(e){
		e.preventDefault(); // don't submit the form
		var color = $('#changeColor').val();
		var id = $('#changeColorId').val();
		$.post(					//post new color
			baseURL+'/users/changeColor/',
			{
				'color': color,
				'id': id
			},
			function(data) {
				if(data.success == 'success') {
					// Edit successful
					$('#changeColorForm').hide(); // hide edit panel
					console.log("redrawing chart");
					drawChart(baseURL+'/users/colorData/', baseURL+'/users/followData/'); // redraw viz
				} else if (data.error != '') {
					alert(data.error); // show error as popup
				}
			},
			'json'
		);
	});
});

// source: http://bl.ocks.org/AndrewRP/7468330
function drawChart(jsonUrl1, jsonUrl2) {
	$('svg').remove(); // clear any previous graphics elements
  var width = 720,
  height = 720,
  outerRadius = Math.min(width, height) / 2 - 10,
  innerRadius = outerRadius - 24;

  var formatPercent = d3.format(".1%");

  var arc = d3.svg.arc()
  .innerRadius(innerRadius)
  .outerRadius(outerRadius);

  var layout = d3.layout.chord()
  .padding(.04)
  .sortSubgroups(d3.descending)
  .sortChords(d3.ascending);

  var path = d3.svg.chord()
  .radius(innerRadius);

  var svg = d3.select("#content").insert("svg")
  .attr("width", width)
  .attr("height", height)
  .append("g")
  .attr("id", "circle")
  .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

	$('#followPerson').hide(); // Hide buttons
	$('#changeColorForm').hide();

  svg.append("circle")
  .attr("r", outerRadius);

  d3.json(jsonUrl1, function(users) {
  d3.json(jsonUrl2, function(matrix) {

  // Compute the chord layout.
  layout.matrix(matrix);

  // Add a group per neighborhood.
  var group = svg.selectAll(".group")
  .data(layout.groups)
  .enter().append("g")
  .attr("class", "group")
  .on("mouseover", mouseover);

  // Add the group arc.
  var groupPath = group.append("path")
  .attr("id", function(d, i) { return "group" + i; })
  .attr("d", arc)
  .style("fill", function(d, i) { return users[i].color; });

  // Add a text label.
  var groupText = group.append("text")
  .attr("x", 6)
  .attr("dy", 15)
  .on("click", function(d, i) {			//when the text is clicked
	if($('#followPerson').is(':visible')) {  //the follow div becomes hidden if visible
		$('#followPerson').hide();
	} else {
		$('#followPerson').show();	//if hidden, become visible
		var follow = false;		//boolean to check if following person clicked
		$.getJSON(baseURL+'/users/followers/', function(response) { //check json list of followers
			$.each(response, function(index, element){
				if (response[index].id === users[i].id){ //if following person clicked
				follow = true;		//follow
				}
			})
			if (follow){
				$('#unfollowButton').show();  //if following show just the unfollow button
				$('#followButton').hide();
			}
			else {
				$('#unfollowButton').hide(); //if not following show just the follow button
				$('#followButton').show();
			}
			document.getElementById('followButton').innerHTML ="Follow "+users[i].username; //edit button title
			document.getElementById('unfollowButton').innerHTML ="Unfollow "+users[i].username; //edit button title
			document.getElementById('unfollowLink').href = baseURL+"/removeFollow/"+users[i].id; //link the button
			document.getElementById('followLink').href = baseURL+"/follow/"+users[i].id; //link the button
    })
	}
});

  groupText.append("textPath")
  .attr("xlink:href", function(d, i) { return "#group" + i; })
  .text(function(d, i) { return users[i].username; });

  // Remove the labels that don't fit. :(
  groupText.filter(function(d, i) { return groupPath[0][i].getTotalLength() / 2 - 16 < this.getComputedTextLength(); })
  .remove();

  // Add the chords.
  var chord = svg.selectAll(".chord")
  .data(layout.chords)
  .enter().append("path")
  .attr("class", "chord")
  .style("fill", function(d) { return users[d.source.index].color; })
  .attr("d", path)
	.on("click", function(d, i) { //if you click a chord
	if($('#changeColorForm').is(':visible')) { // makes the form hidden if visible
		$('#changeColorForm').hide();
	} else { 
		$('#changeColor').val(users[d.source.index].color); //pushes color clicked to edit button
		$('#changeColorId').val(users[d.source.index].id); //pushes id
		$('#changeColorForm').show(); // shows form if hidden
		$('#changeColor').focus();
	}
});

  // Add an elaborate mouseover title for each chord.
   chord.append("title").text(function(d) {
   return users[d.source.index].username
   + " → " + users[d.target.index].username
   + ": " + formatPercent(d.source.value)
   + "\n" + users[d.target.index].username
   + " → " + users[d.source.index].username
   + ": " + formatPercent(d.target.value);
   });
 
// fades when mousedover
  function mouseover(d, i) {
  chord.classed("fade", function(p) {
  return p.source.index != i
  && p.target.index != i;
  });
  }
  });
  });
	};
