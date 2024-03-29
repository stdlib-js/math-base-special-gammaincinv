#!/usr/bin/env Rscript
#
# @license Apache-2.0
#
# Copyright (c) 2018 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set the precision to 16 digits:
options( digits = 16L );

#' Generate test fixtures.
#'
#' @examples
#' main();
main <- function() {
	#' Get the script filepath.
	#'
	#' @return The absolute path of this script
	#'
	#' @examples
	#' filepath <- get_script_path();
	get_script_path <- function() {
		args <- commandArgs( trailingOnly = FALSE );
		needle <- "--file=";
		match <- grep( needle, args );
		if ( length( match ) > 0 ) {
			# Rscript:
			filepath <- sub( needle, "", args[match] );
		} else {
			ls_vars <- ls( sys.frames()[[1]] )
			if ( "fileName" %in% ls_vars ) {
				# Source'd via RStudio:
				filepath <- sys.frames()[[1]]$fileName; # nolint
			} else {
				# Source'd via R console:
				filepath <- sys.frames()[[1]]$ofile;
			}
		}
		return( normalizePath( filepath ) );
	}

	#' Convert a data structure to JSON.
	#'
	#' @param x A data structure to convert
	#' @return JSON blob
	#'
	#' @examples
	#' x <- seq( -6.5, 25, 0.5 );
	#' json <- to_json( x );
	to_json <- function( x ) {
		return( jsonlite::toJSON( x, digits = 16, auto_unbox = TRUE ) );
	}

	#' Generate an output absolute filepath based on the script directory.
	#'
	#' @param name An output filename
	#' @return An absolute filepath
	#'
	#' @examples
	#' filepath <- get_filepath( "data.json" );
	get_filepath <- function( name ) {
		return( paste( source_dir, "/", name, sep = "" ) );
	}

	# Get the directory of this script:
	source_dir <- dirname( get_script_path() );

	# Generate test fixture data:
	p <- seq( 0.05, 0.95, 0.05 );
	k <- seq( 0.5, 1000, 0.5 );
	y <- qchisq( p, k*2.0 ) / 2.0;

	# Handle NaNs:
	cat( y, sep = ",\n" );

	# Convert fixture data to JSON:
	p <- to_json( p );
	k <- to_json( k );
	y <- to_json( y );

	# Write the data to file...
	filepath <- get_filepath( "arg1.json" );
	write( p, filepath );

	filepath <- get_filepath( "arg2.json" );
	write( k, filepath );

	filepath <- get_filepath( "expected.json" );
	write( y, filepath );

	# Generate test fixture data:
	p <- seq( 1.0e-80, 1.0e-4, by = 1e-7 );
	k <- seq( 0.01, 10.0, 0.01 );
	y <- qchisq( p, k*2.0 ) / 2.0;

	# Handle NaNs:
	cat( y, sep = ",\n" );

	# Write the data to file...
	filepath <- get_filepath( "small_arg1.json" );
	write( p, filepath );

	filepath <- get_filepath( "small_arg2.json" );
	write( k, filepath );

	filepath <- get_filepath( "small_expected.json" );
	write( y, filepath );

	# Generate test fixture data:
	p <- seq( 0.9, 0.999, by = 0.0001 );
	k <- seq( 0.001, 10.0, 0.01 );
	y <- qchisq( p, k*2.0 ) / 2.0;

	# Handle NaNs:
	cat( y, sep = ",\n" );

	# Write the data to file...
	filepath <- get_filepath( "large_arg1.json" );
	write( p, filepath );

	filepath <- get_filepath( "large_arg2.json" );
	write( k, filepath );

	filepath <- get_filepath( "large_expected.json" );
	write( y, filepath );

	# Generate test fixture data:
	p <- seq( 0.001, 0.999, 0.001 );
	k <- seq( 0.05, 10000.0, 0.5 );
	y <- qchisq( 1.0-p, k*2.0 ) / 2.0;

	# Handle NaNs:
	cat( y, sep = ",\n" );

	# Write the data to file...
	filepath <- get_filepath( "upper_arg1.json" );
	write( p, filepath );

	filepath <- get_filepath( "upper_arg2.json" );
	write( k, filepath );

	filepath <- get_filepath( "upper_expected.json" );
	write( y, filepath );
}

main();
