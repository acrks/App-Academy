require "rails_helper"

RSpec.describe "poems/index" do
    let(:jasmine) { User.create!(username: 'jasmine', password: 'abcdef') }
    let(:jack) { User.create!(username: 'jacky_boi', password: 'abcdef') }
    let(:jasmine_poem) { Poem.create!( title: 'Fall',
                                        stanzas: 'Fall is within me, all the days',
                                        complete: 'false',
                                        author: jasmine)}
    let(:jack_poem) { Poem.create!( title: 'Sound of Dog',
                                    stanzas: 'Bark Bark, my best friend',
                                    complete: 'true',
                                    author: jack)}
    
    it "has a message indicating the user is viewing all poems" do
        assign(:poems, [jasmine_poem])
        render

        expect(rendered).to match /All Poems/
    end

    it "displays a link to create a new poem" do
        assign(:poems, [jasmine_poem])

        render
        # Note: use the new_poem_url helper
        expect(rendered).to have_link 'Create New Poem', href: new_poem_url
    end

    it "displays all the poem titles" do
        assign(:poems, [jasmine_poem, jack_poem])

        render

        expect(rendered).to match /Fall/
        expect(rendered).to match /Sound of Dog/
    end

    it "displays the word 'Done' if the Poem is complete" do
        assign(:poems, [jack_poem])

        render

        expect(rendered).to match /Done/
    end

    it "does not display the word 'Done' if Poem is incomplete" do
        assign(:poems, [jasmine_poem])

        render

        expect(rendered).not_to match /Done/
    end

    it "displays all the poem stanzas" do
        assign(:poems, [jasmine_poem, jack_poem])

        render

        expect(rendered).to match /Fall is within me, all the days/
        expect(rendered).to match /Bark Bark, my best friend/
    end

    it "displays a link that allows a user to edit a poem" do
        assign(:poems, [jasmine_poem])

        render
        # We expect to see a link to edit a poem with that poem's title
        # Note: use the edit_poem_url helper
        expect(rendered).to have_link 'Edit Poem', href: edit_poem_url(jasmine_poem.id)
    end
end
