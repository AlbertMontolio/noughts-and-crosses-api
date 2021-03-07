require 'rails_helper'
require 'pry'

describe 'Move', type: :model do
  describe '#is_winner?' do
    subject { move.is_winner? }

    let(:creator) { create(:creator) }
    let(:joiner) { create(:joiner) }
    let!(:game) { create(:game, creator: creator, joiner: joiner) }

    context 'with one move' do
      let(:move) { 
        create(:move, game: game, user: creator, pos_x: -1, pos_y: 1) 
      }

      it 'is not winner' do
        expect(subject).to eq(false)
      end
    end

    context 'when 3 horizontal moves' do
      context 'when not winner moves' do
        let!(:creator_move_one) { create(:move, game: game, user: creator, pos_x: -1, pos_y: 1) }   
        let!(:creator_move_two) { create(:move, game: game, user: creator, pos_x: 0, pos_y: 1) }   
        let!(:joiner_move_one) { create(:move, game: game, user: joiner, pos_x: 1, pos_y: 1) }   

        it 'is not winner' do
          expect(joiner_move.is_winner?).to eq(false)
        end
      end

      context 'when winner moves' do
        let!(:creator_game) { create(:game, creator: creator, joiner: joiner) }
        let!(:creator_move_one) { create(:move, game: creator_game, user: creator, pos_x: -1, pos_y: 1) }   
        let!(:creator_move_two) { create(:move, game: creator_game, user: creator, pos_x: 0, pos_y: 1) }   
        let!(:creator_move_three) { create(:move, game: creator_game, user: creator, pos_x: 1, pos_y: 1) }   

        it 'is winner' do
          expect(creator_move_three.is_winner?). to eq(true)
        end
      end
    end

    ### todo same strategy for diagonal lines and vertical. refactor with shared_exampples
  end
end
