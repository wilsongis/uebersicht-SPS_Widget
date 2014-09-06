refreshFrequency: 60000

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/Documents/SPS/DailySPS.txt'

command: "cat #{todolistfile} | awk 'BEGIN {print \"\"} /^[###]/ {print \"<br />\"substr($0,4)\"<br />\"} /^[*]/ {print \"<blockquote><li>\"substr($0,2)\"</li></blockquote>\"} END {print \"\"}'"

style: """
  background-color: rgba(255,255,255,0.6)
  border-radius: 6px
  padding: 0px 20px
  top: 200px
  left: 40%
  color: #333
  font-family: Helvetica Neue

  h
    display: block
    text-align: center
    font-size: 24px
    font-weight: 100

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 12px

  ol
    padding-left: 20px

  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <h>Daily SPS</h>
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)