# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find {|candidate| candidate[:id] == id } ?
  @candidates.find {|candidate| candidate[:id] == id } : nil
end

def experienced?(candidate)
  candidate[:years_of_experience] > 2 ? 
                                 true : false
end

def qualified_candidates(candidates)
  experienced_candidates = candidates            .select{ |candidate| experienced? candidate }
  gitty_about_100_points = experienced_candidates.select{ |candidate| candidate[:github_points] >= 100 }
  pyyc_junkies = gitty_about_100_points          .select{ |candidate| candidate[:languages].include? "Python" }
  application_is_open = pyyc_junkies             .select{ |candidate| (Date.today - candidate[:date_applied]) < 15 }
  not_a_wipper_snapper = pyyc_junkies            .select{ |candidate| candidate[:age] > 17 }
end

def priority_candidates(candidates)
  candidates.sort_by{ |candidate| [candidate[:years_of_experience], candidate[:github_points]]}
end
# More methods will go below
