<template>



<div class="tree" :style="style"></div>



</template>
<style scoped lang="stylus">


.tree
    position absolute


</style>
<script lang="coffee">


Position = require "./../utils/Position.coffee"


module.exports =

    data: ->

    props:
        state: 0
        position: Position
        options: Object


    computed:

        color: -> ["green", "red", "grey"][@state]

        style: ->
            s = @options.spaceScale
            {x, y} = @position
            top: -y*s + "px"
            left: x*s + "px"
            backgroundColor: @color
            height: s + "px"
            width: s + "px"
            transform: "translate(-#{s}px, #{s}px)"

</script>
