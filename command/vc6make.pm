#
# $Id$
#

package vc6Make;

use strict;
use warnings;

use Cwd;
use File::Path;

###############################################################################
# Constructor

sub new
{
    my $proto = shift;
    my $class = ref ($proto) || $proto;
    my $self = {};

    bless ($self, $class);
    return $self;
}

##############################################################################

sub CheckRequirements ()
{
    my $self = shift;
    my $root = main::GetVariable ('root');

    if (!defined $root) {
        print STDERR __FILE__, ": Requires \"root\" variable\n";
        return 0;
    }
    
    return 1;
}

##############################################################################

sub Run ($)
{
    my $self = shift;
    my $options = shift;
    my $root = main::GetVariable ('root');
    my $project_root = main::GetVariable ('project_root');

    # replace all '\x22' with '"'
    $options =~ s/\\x22/"/g;

    if (!defined $project_root) {
        $project_root = 'ACE_wrappers';
    }
    
    if (!-r $project_root || !-d $project_root) {
        mkpath($project_root);
    }

    if (!-r $root || !-d $root) {
        mkpath($root);
    }

    # chop off trailing slash
    if ($root =~ m/^(.*)\/$/) {
        $root = $1;
    }

    main::PrintStatus ('Compile', 'vc6make');

    my $current_dir = getcwd ();
    
    if (!chdir $project_root) {
        print STDERR __FILE__, ": Cannot change to $project_root\n";
        return 0;
    }

    my $basedir = getcwd();
    my $command = "msdev.com /y3 $options";

    print "Running: $command\n";

    my $ret = system ($command);

    if( $ret != 0  )
    {
        my $working_dir = getcwd();

        if( $command =~ /\-C\s+([\w\/]+)/  )
        {
            $working_dir = "$working_dir/$1"; 
        }

        print "[BUILD ERROR detected in $working_dir]\n ";
    } 

    chdir $current_dir;

    return 1;
}

##############################################################################

main::RegisterCommand ("vc6make", new vc6Make ());
