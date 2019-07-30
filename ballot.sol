pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;
contract Ballot {

    string CApubkey;
    uint[] public votes;
    mapping (address => bool) hasVoted;
    string[] public candidates;

    /// Create a new ballot with different candidates
    constructor(string[] memory _candidates, string memory _capubkey) public {
        CApubkey = _capubkey;
        candidates = _candidates;
        votes.length = candidates.length;
    }

    function vote(uint option) public {
        require(0 <= option && option < candidates.length, "Invalid option");
        require(!hasVoted[msg.sender], "Account has already voted");

        hasVoted[msg.sender] = true;
        votes[option] = votes[option] + 1;
    }

    function getCandidates() public view returns (string[] memory) {
        return candidates;
    }

    function getVotes() public view returns (uint[] memory) {
        return votes;
    }


    function isValidVote(/* string memory _vote, string memory _signedVote */) public pure returns(bool) {
        // Check signature on _signedVote with CApubkey
        return true;
    }

    function winningCandidate() public view returns (string memory candidate) {
        uint256 winningVoteCount = 0;
        for (uint8 i = 0; i < candidates.length; i++)
            if (votes[i] > winningVoteCount) {
                winningVoteCount = votes[i];
                candidate = candidates[i];
            }
    }
}
