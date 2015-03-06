use strict; use warnings;

package AndreyKovbovichFindIndex;

sub new { bless {}, shift; }

sub find {
	my ($_self, $n, $arr) = @_;
	Find::Impl::find($n, $arr);
}

package Find::Impl;

sub find {
	my ($n, $arr) = @_;
        return (1, 0) unless @$arr; # return $arr length + 1 in case of empty array
	find_rec($n, $arr, 1, 0, $#$arr);
}

sub find_rec {
	my ($n, $arr, $cnt, $l, $r) = @_;
	my $pivot = int (($l + $r) / 2);

	if ($pivot == $l or $pivot == $r) { # check if we are done
		return abs($n - $arr->[$l]) <= abs($arr->[$r] - $n)
			? ($l, $cnt) : ($r, $cnt);
	}

	if ($n <= $arr->[$pivot]) { # search in the right partition
		@_ = ($n, $arr, $cnt + 1, $l, $pivot);
	}
	else {                      # in the left, otherwise
		@_ = ($n, $arr, $cnt + 1, $pivot, $r);
	}

	goto &find_rec; # TCO
}

1;
