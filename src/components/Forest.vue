<template>

<div class="forest">
    <tree
        v-for="tree in trees"
        :position="tree.position"
        :state="tree.state"
        :options="options">
    </tree
</div>

</template>
<style scoped lang="stylus">


.forest
    position absolute
    top 50%
    left 50%
    height 0
    width 0

</style>
<script lang="coffee">


Vue = require "vue"
Promise = require "promise"
Tree = require "./Tree.vue"
Position = require "./../utils/Position.coffee"
random = require "./../utils/random.coffee"
timeout = require "./../utils/timeout.coffee"



module.exports =

    data: ->

        trees: {}

        options:
            spaceScale: 5
            timeScale: 1
            p: 0.5
            burningTime: # ms
                min: 200
                max: 300
            maxTrees: 10000
            areaSize: 5000


    computed:

        nbTrees: ->
            Object.keys(@trees).length



    methods:

        at: (position) ->
            pos = position.toString()
            # Change when commit in stable vue.js
            unless @trees[pos]?
                Vue.set @trees, pos,
                    position: new Position position
                    state: 0
                    options: @options
            @trees[pos]


        canBurn: (tree) ->
            {p, areaSize: s, maxTrees} = @options
            rdm = random.below p
            isTree = tree.state is 0
            max = @nbTrees < maxTrees
            {x, y} = tree.position
            inside = (-s <= x <= s) and (-s <= y <= s)
            rdm and isTree and max and inside


        ignite: (tree, force = false) ->
            if force or @canBurn tree
                tree.state = 1
                {min, max} = @options.burningTime
                time = (random.ab min, max)*@options.timeScale
                timeout time, =>
                    tree.state = 2
                    tree.position.neighboors().forEach (p) => @ignite @at p


    ready: ->
        origin = new Position 0, 0
        @ignite @at(origin), true


    components:
        tree: Tree


</script>



