createSegmentHostname() {
    [ -n "$BYOBU_CONFIG_DIR" ] && return
    nextSegment "$branch_color_fg" "$branch_color_bg"
	add "${HOSTNAME}"
}

createSegments() {
	createSegmentLastCommand
	createSegmentHostname
	createSegmentPwd
	createSegmentGitBranch
	createSegmentGitStatus
	createSegmentPrompt
}
