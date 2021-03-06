% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tree_apply.R
\name{tree_apply}
\alias{tree_apply}
\alias{treeApply}
\alias{tree_apply.default}
\alias{tree_apply.igraph}
\alias{tree_apply.dendrogram}
\title{Apply a function recursively to a tree}
\usage{
tree_apply(tree, FUN, ...)

\method{tree_apply}{default}(tree, FUN, ...)

\method{tree_apply}{igraph}(tree, FUN, direction = "down", mode = "out",
  ...)

\method{tree_apply}{dendrogram}(tree, FUN, direction = "down", ...)
}
\arguments{
\item{tree}{A tree-like object. Currently support for igraph objects}

\item{FUN}{The function to apply to each node. The function must return a
modified version of the graph if \code{class(tree) == 'igraph'} or a modified
version of the node if \code{class(tree) == 'dendrogram'}}

\item{...}{Additional parameters to \code{FUN}}

\item{direction}{The direction of the recursion. If \code{direction = 'down'}
The parent will get handled before the children, while the reverse is true if
\code{direction = 'up'}}

\item{mode}{For \code{class(tree) == 'igraph'} the directionality of the
edges in the graph. If \code{mode = 'out'} then parents points towards their
children, while the reverse is true for \code{mode = 'in'}}
}
\value{
A modified version of \code{tree} (if anything is modified in
\code{FUN})
}
\description{
This function allows for easy recursive function calling of tree-like
structures. The recursion can happen either downwards, calling the children
after the parent, or upwards, calling the parent after the children. At each
recursion there is access to the node(s) that was/were called before and thus
have already been through the function.
}
\details{
The function is called with a set of predifined parameters along
with user defined ones. If \code{direction = 'down'} The parameters supplied
automatically to the function are: \code{node}, \code{parent}, \code{depth}
and \code{tree}, while if \code{direction = 'up'} the parameters are:
\code{node}, \code{children}, \code{depth} and \code{tree}. The nature of
\code{node}, \code{parent} and \code{children} depends on the class of
\code{tree}. If \code{class(tree) == 'igraph'} they will be indices of the
relevant vertices in the graph. If \code{class(tree) == 'dendrogram'} they
will be the actual dendrogram objects.
}
\keyword{internal}
