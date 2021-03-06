<!DOCTYPE html>
<meta charset="utf-8">
<title>Test File</title>
<style>


#circle circle {
fill: none;
pointer-events: all;
}

.group path {
fill-opacity: .5;
}

path.chord {
stroke: #000;
stroke-width: .25px;
}

#circle:hover path.fade {
display: none;
}

</style>

<header>

</header>

<h1>Test</h1>

<script src="http://d3js.org/d3.v2.min.js?2.8.1"></script>

<script>

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

d3.json("<?= json_encode($colorArray) ?>", function(users) {
d3.json("<?= json_encode($userArray) ?>", function(matrix) {

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
.attr("d", path);

// Add an elaborate mouseover title for each chord.
 chord.append("title").text(function(d) {
 return users[d.source.index].username
 + " → " + users[d.target.index].username
 + ": " + formatPercent(d.source.value)
 + "\n" + users[d.target.index].username
 + " → " + users[d.source.index].username
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

</script>


<footer>

</footer>
