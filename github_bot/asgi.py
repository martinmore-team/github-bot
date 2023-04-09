# import os


# from github_bot.utils.context import get_context


from fastapi import FastAPI
from strawberry.fastapi import GraphQLRouter

from github_bot.schema import schema

# GraphQL
# graphql_app = GraphQLRouter(schema, path="/githubbot/", context_getter=get_context)
graphql_app = GraphQLRouter(schema, path="/githubbot/")
fastapp = FastAPI()
fastapp.include_router(graphql_app, prefix="/api/graph")
