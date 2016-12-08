
$(document).ready(function(){

	// calling this method draws the dendrogram viz using this JSON file
	drawChart(baseURL+'/users/colorData/', baseURL+'/users/followData/');

// 	$('#editShirtTitleForm').submit(function(e){ // update on sign-up or follow
// 		e.preventDefault(); // don't submit the form
//
// 		var title = $('#editShirtTitle').val();
// 		var id = $('#editShirtID').val();
//
// 		$.post(
// 			baseURL+'/shirts/editTitle/process/',
// 			{
// 				'title': title,
// 				'id': id
// 			},
// 			function(data) {
// 				if(data.success == 'success') {
// 					// Edit successful
// 					$('#editShirtTitleForm').hide(); // hide edit panel
// 					drawChart(baseURL+'/users/colorData/', baseURL+'/users/followData/'); // redraw viz
// 				} else if (data.error != '') {
// 					alert(data.error); // show error as popup
// 				}
// 			},
// 			'json'
// 		);
// 	});
//
});

// source: http://bl.ocks.org/mbostock/4063570
function drawChart(jsonUrl1, jsonUrl2) {
	$('svg').empty(); // clear any previous graphics elements
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

  var svg = d3.select("body").append("svg")
  .attr("width", width)
  .attr("height", height)
  .append("g")
  .attr("id", "circle")
  .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

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
  .attr("dy", 15);

  groupText.append("textPath")
  .attr("xlink:href", function(d, i) { return "#group" + i; })
  .text(function(d, i) { return users[i].name; });

  // Remove the labels that don't fit. :(
  groupText.filter(function(d, i) { return groupPath[0][i].getTotalLength() / 2 - 16 < this.getComputedTextLength(); })
  .remove();

  // Add the chords.
  var chord = svg.selectAll(".chord")
  .data(layout.chords)
  .enter().append("path")
  .attr("class", "chord")
  .style("fill", function(d) { return users[d.source.index].color; })
  .attr("d", path);

  // Add an elaborate mouseover title for each chord.
   chord.append("title").text(function(d) {
   return users[d.source.index].name
   + " → " + users[d.target.index].name
   + ": " + formatPercent(d.source.value)
   + "\n" + users[d.target.index].name
   + " → " + users[d.source.index].name
   + ": " + formatPercent(d.target.value);
   });

  function mouseover(d, i) {
  chord.classed("fade", function(p) {
  return p.source.index != i
  && p.target.index != i;
  });
  }
  });
  });


	};
