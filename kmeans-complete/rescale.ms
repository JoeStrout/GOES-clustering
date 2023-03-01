#!/usr/local/bin/miniscript

infile = file.open("ch1-7-12-raw.csv", "r")
out = []
count = 0
while not infile.atEnd
	line = infile.readLine
	if line == null then 
		print "Null line at count " + count
		break
	end if
	//print "line: " + line
	nums = line.split(",")
	//print "original: " + nums
	nums[0] = val(nums[0]) / 1.1933322
	nums[1] = val(nums[1]) / 256.77209473
	nums[2] = val(nums[2]) / 297.76239014
	//print "scaled:   " + nums
	//print "new line: " + nums.join(",")
	out.push nums
//	outfile.writeLine nums.join(",")
	
	count = count + 1
	if count % 1000 == 0 then print count + " lines done"
end while
infile.close

print "Writing file..."
outfile = file.open("ch1-7-12-scaled.csv", "w")
for line in out
	outfile.writeLine line.join(",")
end for
outfile.close

print "All done!"

