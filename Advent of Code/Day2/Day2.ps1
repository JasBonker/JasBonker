﻿<#
Author:     Bas Jonker
Date:       06-12-2021 DD/MM/YYYY
Function:   Calculating final position after input commands are executed.
--------------------------------------------------------------------------


Assignment: 
--- Day 2: Dive! ---
Now, you need to figure out how to pilot this thing.

It seems like the submarine can take a series of commands like forward 1, down 2, or up 3:

forward X increases the horizontal position by X units.
down X increases the depth by X units.
up X decreases the depth by X units.
Note that since you're on a submarine, down and up affect your depth, and so they have the opposite result of what you might expect.

The submarine seems to already have a planned course (your puzzle input). You should probably figure out where it's going. For example:

forward 5
down 5
forward 8
up 3
down 8
forward 2
Your horizontal position and depth both start at 0. The steps above would then modify them as follows:

forward 5 adds 5 to your horizontal position, a total of 5.
down 5 adds 5 to your depth, resulting in a value of 5.
forward 8 adds 8 to your horizontal position, a total of 13.
up 3 decreases your depth by 3, resulting in a value of 2.
down 8 adds 8 to your depth, resulting in a value of 10.
forward 2 adds 2 to your horizontal position, a total of 15.
After following these instructions, you would have a horizontal position of 15 and a depth of 10. (Multiplying these together produces 150.)

Calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?
#>
<# Assignment 1

#Horizontal/depth starting values:
$horizontal = 0
$depth      = 0

#Initializing directional variables:
$forward = @()
$down = @()
$up = @()

#Importing the input values:
$plannedroute = get-content -Path '.\input.txt'

#Deviding inputs according to its action and adding/substracting it to either $horizontal or $depth:

foreach($input in $plannedroute){
 
if($input -match "forward"){                        
$horizontal += $input -replace "[^0-99]" , ''
$depth += $aim
$aim = 0
$forwardInterval = 0
}

if($input -match "down"){                             
$aim += $input -replace "[^0-9]" , ''
}

if($input -match "up"){
$aim -= $input -replace "[^0-9]" , ''
}
}

$Result = $depth * $horizontal
$Result
#>

#Horizontal/depth starting values:
$horizontal = 0
$depth      = 0

#Initializing directional variables:
$forward = @()
$forwardInterval = 0
$aim = 0
$down = @()
$up = @()

#Importing the input values:
$plannedroute = get-content -Path '.\input.txt'

#Deviding inputs according to its action and adding/substracting it to either $horizontal or $depth:

foreach($input in $plannedroute){
 
if($input -match "down"){                             
$aim += $input -replace "[^0-9]" , ''
}

if($input -match "up"){
$aim -= $input -replace "[^0-9]" , ''
}

if($input -match "forward"){                        
$horizontal += $input -replace "[^0-99]" , ''
$forwardInterval = $input -replace "[^0-99]" , ''
$depth += $aim * $forwardInterval
$forwardInterval = 0
}
}

#Calculating 'finalposition'
$Result = $horizontal * $depth
$Result

#hoi git commit dit even