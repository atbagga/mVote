pragma solidity >=0.4.22 <0.6.0;
contract Ballot {

    string CApubkey;

    struct Candidates {
        int32 id;
    }

    Candidates[] candidates;

    /// Create a new ballot with $(_numProposals) different proposals.
    constructor(uint8 _numCandidates, string memory _caPubKey) public {
        candidates.length = _numCandidates;
        CApubkey = _caPubKey;
    }

    /// Give $(toVoter) the right to vote on this ballot.
    /// May only be called by $(chairperson).
    function isValidVote(/* string memory _vote, string memory _signedVote */) public pure returns(bool) {
        // Check signature on _signedVote with CApubkey
        return true;
    }

    /// Give a single vote to proposal $(toProposal).
    function vote(uint8 toProposal) public {
    }
}
